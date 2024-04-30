SOURCES = $(shell find lexer -name '*.cpp')
HEADERS = $(shell find lexer -name '*.h')
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
JSON_DIR = $(BUILD_DIR)/json

OBJ = $(addprefix $(OBJ_DIR)/, $(notdir $(SOURCES:.cpp=.o)))

CC = clang++ -stdlib=libc++ -std=c++14
CFLAGS = -g -O3 -I "./" -I llvm/include -I llvm/build/include
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs all`

.PHONY: dir
dir:
	mkdir -p $(OBJ_DIR)
	mkdir -p $(JSON_DIR)

$(OBJ_DIR)/%.o: ${SOURCES} | dir
	${CC} ${CFLAGS} ${LLVMFLAGS} -MJ $(JSON_DIR)/$(@F:.o=.json) -c $< -o $@

.PHONY: compile_db
compile_db: ${OBJ} | dir
	echo "[" > compile_commands.json
	cat $(JSON_DIR)/*.json >> compile_commands.json
	sed -i '$$ s/,$$//' compile_commands.json
	echo "]" >> compile_commands.json

.PHONY: main
main: compile_db main.cpp ${OBJ}
	${CC} ${CFLAGS} ${LLVMFLAGS} ${OBJ} main.cpp -o $@

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -f main compile_commands.json
