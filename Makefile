CC=gcc

OPTFLAGS = -O3

USE_MKL=0

ifeq ($(USE_MKL),1)
	CFLAGS= -DUSE_MKL
	LIBS = -lmkl_core -fopenmp -lmkl_sequential -lmkl_intel_lp64 -lm
	#INCLUDEPATH = -I/opt/intel/composerxe-2013.1.106/mkl/include/
	#LIBRARYPATH = -L/opt/intel/composerxe-2013.1.106/mkl/lib/intel64/
else
	LIBS = -fopenmp -lblas -lm -llapack
	#INCLUDEPATH = -I...
	#LIBRARYPATH = -L...
endif

all: PSIRWLS-predict PSIRWLS-train

PSIRWLS-predict: PSIRWLS-predict.c
	$(CC) $(OPTFLAGS) $(CFLAGS) $(INCLUDEPATH) $(LIBRARYPATH) -o PSIRWLS-predict PSIRWLS-predict.c $(LIBS)

PSIRWLS-train: PSIRWLS-train.c
	$(CC) $(OPTFLAGS) $(CFLAGS) $(INCLUDEPATH) $(LIBRARYPATH) -o PSIRWLS-train PSIRWLS-train.c $(LIBS)

clean:
	rm -f PSIRWLS-train PSIRWLS-predict

