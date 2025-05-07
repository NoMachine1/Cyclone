# Detect OS
UNAME_S := $(shell uname -s)

# Enable static linking by default (change to 'no' to use dynamic linking)
STATIC_LINKING = yes

# Compiler settings based on OS
ifeq ($(UNAME_S),Linux)
# Linux settings

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -m64 -std=c++17 -Ofast -march=native -mtune=native \
           -Wall -Wextra -Wno-write-strings -Wno-unused-variable \
           -Wno-deprecated-copy -Wno-unused-parameter -Wno-sign-compare \
           -Wno-strict-aliasing -Wno-unused-but-set-variable \
           -funroll-loops -ftree-vectorize -fstrict-aliasing \
           -fno-semantic-interposition -fvect-cost-model=unlimited \
           -fno-trapping-math -fipa-ra -flto -fassociative-math \
           -fopenmp -mavx2 -mbmi2 -madx -fwrapv \
           -fomit-frame-pointer -fpredictive-commoning -fgcse-sm -fgcse-las \
           -fmodulo-sched -fmodulo-sched-allow-regmoves -funsafe-math-optimizations

# Source files
SRCS = Cyclone.cpp SECP256K1.cpp Int.cpp IntGroup.cpp IntMod.cpp \
       Point.cpp ripemd160_avx2.cpp sha256_avx2.cpp

# Object files
OBJS = $(SRCS:.cpp=.o)

# Target executable
TARGET = Cyclone

# Link the object files to create the executable and then delete .o files
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)
	rm -f $(OBJS) && chmod +x $(TARGET)

# Compile each source file into an object file
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build files
clean:
	@echo "Cleaning..."
	rm -f $(OBJS) $(TARGET)

# Phony targets
.PHONY: all clean 

else
# Windows settings (MinGW-w64)

# Compiler
CXX = g++

# Check if compiler is found
CHECK_COMPILER := $(shell which $(CXX))

# Add MSYS path if the compiler is not found
ifeq ($(CHECK_COMPILER),)
  $(info Compiler not found. Adding MSYS path to the environment...)
  SHELL := powershell
  PATH := C:\msys64\mingw64\bin;$(PATH)
endif

# Compiler flags (without LTO)
CXXFLAGS = -m64 -std=c++17 -Ofast -mssse3 -Wall -Wextra \
           -Wno-write-strings -Wno-unused-variable -Wno-deprecated-copy \
           -Wno-unused-parameter -Wno-sign-compare -Wno-strict-aliasing \
           -Wno-unused-but-set-variable -funroll-loops -ftree-vectorize \
           -fstrict-aliasing -fno-semantic-interposition -fvect-cost-model=unlimited \
           -fno-trapping-math -fipa-ra -fassociative-math -fopenmp \
           -mavx2 -mbmi2 -madx -fwrapv

# Add -static flag if STATIC_LINKING is enabled
ifeq ($(STATIC_LINKING), yes)
    CXXFLAGS += -static
else
    $(info Dynamic linking will be used. Ensure required DLLs are distributed)
endif

# Source files
SRCS = Cyclone.cpp SECP256K1.cpp Int.cpp IntGroup.cpp IntMod.cpp \
       Point.cpp ripemd160_avx2.cpp sha256_avx2.cpp 

# Object files
OBJS = $(SRCS:.cpp=.o)

# Target executable
TARGET = Cyclone.exe

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)
	rm -f $(OBJS)

# Compile each source file into an object file
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build files
clean:
	@echo Cleaning...
	rm -f $(OBJS) $(TARGET)

# Phony targets
.PHONY: all clean
endif
