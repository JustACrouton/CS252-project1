# Variables
JAVAC=/usr/bin/javac
SRC=src
BIN=bin
JAR_NAME=Median.jar
MAIN_CLASS=cs252.TestMedian
TESTS ?= 5

# Default target
all: $(JAR_NAME)

# Compile Java files to class files
$(BIN)/cs252/%.class: $(SRC)/cs252/%.java
	mkdir -p $(@D)
	$(JAVAC) -g -d $(BIN) -cp $(SRC):$(BIN) $<

# Create JAR file with main class
$(JAR_NAME): $(BIN)/cs252/TestMedian.class $(BIN)/cs252/Median.class
	jar cfe $(JAR_NAME) $(MAIN_CLASS) -C $(BIN) cs252

# Run the JAR file with command-line arguments
run: $(JAR_NAME)
	java -jar $(JAR_NAME) $(TESTS)

# Clean up generated files
clean:
	-rm -rf $(JAR_NAME) $(BIN)

# Help target to display makefile rules
help:
	@echo "Available rules:"
	@echo "  all   - Build the JAR file (default rule)."
	@echo "  run   - Run the JAR file with default or specified number of tests (make run TESTS=10)."
	@echo "  clean - Remove all generated files."
	@echo "  help  - Display this help message."

