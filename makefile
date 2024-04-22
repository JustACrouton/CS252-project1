JAVAC=/usr/bin/javac
SRC=src
BIN=bin

all: Median.jar

bin/cs252/%.class: $(SRC)/cs252/%.java
	mkdir -p $(@D)
	$(JAVAC) -g -d $(BIN) -cp $(SRC):$(BIN) $<

Median.jar: bin/cs252/TestMedian.class bin/cs252/Median.class
	jar cfe $@ cs252.TestMedian -C bin cs252

run: Median.jar
	java -jar $<

clean:
	-rm -rf Median.jar bin

