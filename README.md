# Minimalist-CPU-Architecture-Project
![Capture](https://github.com/user-attachments/assets/113f5717-921d-4ba6-9394-ffcc38c08c38)


This project is a hands-on implementation of a simple minimalist microprocessor (μP). The objective is to design and code essential components of a 16-bit data bus / 12-bit address bus architecture.

## 🧠 Project Overview
We aim to build a microprocessor that features:
- **16-bit data bus**
- **12-bit address bus**
- A simplified datapath that supports basic instruction execution

The microprocessor includes a set of essential components required for basic arithmetic and logic operations, as well as control flow.

## 🔧 Core Components

The datapath includes the following elements:

- **Program Counter (PC):** Holds the address of the next instruction to execute.
- **Accumulator (ACC):** Stores the data currently being processed.
- **Arithmetic Logic Unit (ALU):** Supports basic operations: addition, subtraction, AND, OR, XOR.
- **Instruction Register (IR):** Holds the current instruction being executed.
- **MUXA & MUXB:** Multiplexers to direct data through the datapath.
- **Three-State Buffer:** Connects or disconnects the ACC from the data bus when necessary.
- **Control Logic:** Regulates data flow, register loading, reset signals, and ALU operation codes.

Each register includes synchronous load and reset commands (not shown in the structural diagrams).

## 🧾 Instruction Format

Each instruction is 16 bits wide, and includes:
- **Opcode (operation code):** Specifies the instruction type (e.g., `ADD`, `SUB`, etc.)
- **Operand Address:** Specifies the memory address of the data used in the operation.

The architecture follows a **single-address machine model**, where the accumulator is an implicit operand for most operations.

### Example:
An `ADD` instruction performs the following:

![image](https://github.com/user-attachments/assets/f013fc9a-d199-434f-a055-127672cfe0b8)

Instructions are fetched sequentially from memory, starting at address 0.

## ⚙️ Instruction Set

The microprocessor supports a set of **8 elementary instructions**, which are translated into binary by an **assembler**. This assembler handles the conversion from human-readable source code to machine-executable binary code.

