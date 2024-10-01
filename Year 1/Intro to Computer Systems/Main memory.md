- Made from transistors and capacitors on silicon.
- They require power to maintain their state (volatile)
- Information is stored in binary and is organised into 8-bit bytes.
- Each byte is assigned a distinct numeric address.
- Data can be transferred in bursts of 10-25 GB per second, with latency typically ranging between 10 and 20 nanoseconds.

## Caches
Caches are relatively small amounts of fast access memory, using static RAM (transistors, not capacitors), generally located on the CPU chip itself.

- Uses the idea that memory locations recently accessed may need to be accessed again soon.
- We keep a copy of a set of chunks of recently used memory in cache, meaning they are then faster to retrieve from cache than main memory.

- The CPU will look in the cache first, a _**hit**_ occurs when the CPU finds the data it is looking for in the cache.
- A cache _**miss**_ occurs when the CPU cannot find the data it is looking for in the cache. The data is then retrieved normally from main memory.
- A _**write-to-memory**_ means copying the contents of the cache back to memory, or updating memory directly.

Many systems will have multiple levels of caches, located progressively further away from the CPU and closer to main memory. Caching can significantly improve the performance of a system if used effectively.

## Virtual memory
Data which appears to be in main memory may actually be in a hard disk drive. Main memory appears much bigger than it physically is, because there is usually more addresses available than there is memory to address.

The extra addresses are called a _**virtual address space**_ which is mapped to a smaller _**physical address space**_, the details of this are hidden from the programmer. Virtual memory exploits the idea that not all main memory occupied by one or more programs is actually required at any one time, the OS and hardware will then work together to make the virtual address space available as if it were physical memory.

## Paging
Data is copied between main memory and disk as needed using a process known as paging. Paging is managed by the Operating System and is invisible to an application programmer. Although a high amount of paging will cause a program to run slowly.

## Storage types
- Primary memory
	- Volatile memory which is fast but limited in capacity.
	- E.g: RAM, Cache.
- Secondary memory
	- Persistent (non-volatile) storage devices which are directly connected to the computer.
	- Larger capacity than primary memory.
	- Longer access time.
	- Lower data rate (bandwidth).
- Tertiary memory
	- Slow, long-term storage such as backups.
