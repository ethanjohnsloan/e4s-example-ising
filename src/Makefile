FC = gfortran
FFLAGS = -O2 -Wall

TARGET = ising

OBJS = \
	main.o\
	init.o\
	random.o\
	sweep.o\
	energy.o\
	magnetization.o\
	snapshot.o

all: directories $(TARGET)

$(TARGET): $(OBJS)
	$(FC) $(FFLAGS) -o $(TARGET) $(OBJS)

%.o: %.f ising.inc
	$(FC) $(FFLAGS) -c $<

directories:
	mkdir -p ../output

clean:
	rm -f *.o
	rm -f $(TARGET)

distclean: clean
	rm -f ../output/*.dat
