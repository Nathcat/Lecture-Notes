The physical layout of data on a storage device is hidden from the programmer and the user. You see a _**file system**_, which is essentially a virtual storage device with characteristics determined by the physical storage device, the logic circuitry, and the operating system.

For the user, a file is a continuous sequence of bytes which can be interpreted in many ways by programs. The entire sequence of bytes, or sections of it, can be moved between main memory and disk or other devices. Files also have names and associated metadata. They can also be organised into a hierarchy and be identified by relative or absolute path names.

For the operating system, a file is still a continuous sequence of bytes, but that sequence is contained withing a collection of blocks, which may be physically scattered across the storage medium. The file does not share a block with any other file, even if there is space left in the block, this means that a file might use up more disk space than its file size would suggest, because it must always occupy whole blocks.

These blocks are used so that the Operating system may efficiently record and assemble the data constituting a file. It maintains a table, held on the disk, recording which blocks make up a file, this is called the file table.

To be able to allocate a new block to a file, the operating system will keep track of unused blocks (the free list). Directories are also files, but instead hold housekeeping information about the files within them.

There is a trade off regarding the size of the blocks, larger blocks would:
- Increase speed (as more bytes can be read in one go)
- Reduce capacity, since there is more wasted space for smaller / odd size files.

## Special purpose file systems
- Optical disk file system - minimises non-sequential access, supporting incremental updates on write-once optical media (e.g. ISO 9660).
- Tape file system - Avoiding time consuming and repeated tape movement when writing new data (e.g. LTFS).
- Transactional file system - Ensuring consistency between multiple file system operations, like in a database system.
- Distributed or network file system - Access to files that are distributed or processed simultaneously across a network / cluster of computers.