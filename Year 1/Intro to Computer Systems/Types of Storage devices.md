## Magnetic disks
- May be either fixed or removable.
- Contains rotating platters of magnetic material.
- Patches of the surface coating of the platters are magnetised in different directions, the direction of magnetisation encodes a bit.

The read / write head floats on an air cushion just above the surface of the disk, which rotates underneath. The disk itself is organised into sectors, as well as data bits, and some "housekeeping" bits for error correction etc...

A single disk package contains 1 or more platters, on which the density of storage is about 100,000 bits / cm around the track, typically with about 10,000 tracks per cm.
## Flash memory
- Either fixed (SSD, ROM) or removable (memory card, USB flash drive).
- Contains "floating-gate" metal oxide semiconductor field effect transistors (MOSFETs) configured as NAND gates.

This contains circuits which trap electrons in tiny silicon dioxide chambers. They also have "floating-gate" metal oxide semiconductor field effect transistors (MOSFETs) configured as NAND gates. Repeatedly erasing slowly damages this media.
## Optical disk (CD/DVD/Blu-ray)
- Portable, often used for backup or distribution of software, multimedia content.
- Data is encoded on a spiral track, either as pits / bumps or as properties of dye / alloy coating.
- Data is read and written by a laser

Data is recorded on a single track consisting of individual sectors, spiralling out towards the outer edge. The speed of rotation can change to allow for a constant data rate, depending on where the data is located on the disk. The wavelength of the laser determines the smallest patch it can illuminate, and therefore the smallest area that can be used to represent a bit.
### Writable optical disks
Instead of pits and bumps, the photocell detects changes in the properties of a dye, or changes in the crystalline state of an alloy coating. A high powered laser which is controlled by logic signals, can then be used to change the properties of the dye (write-once), or alloy coating (writable many times).
### CD
These have bumps on the surface less than 1 micron ($10^{-6}m$ across). The spiral is 5.6 km long and is read at 120 cm / s for music, which gives roughly 77 minutes, although slightly less to allow for housekeeping bits.

This requires a rotation speed of 530-200 rpm, and gives a capacity of about 650 Mega bytes.

Data transfer rate only 150,000 - 175000 bytes per second at basic speed, they can spin up to 32 times faster, but they are still a lot slower than a magnetic disk.
### DVD
These are effectively just improved CDs, they have smaller pits / bumps, better lasers, and a tighter spiral. They can also be made with multiple layers.

A standard DVD has 4.7 GB capacity, but with layering this allows for up to 17 GB capacity.
### Blu-ray
These use blue lasers, which have a very short wavelength. The normal capacity for a Blu-ray disk is 25 or 50 GB for single / dual layer. XL Quad-layer disks can store up to 128 GB of data, at a data rate of 4.5 - 72 MB / second.

Note that both DVD and Blu-ray use encryption to control access to the content and prevent unauthorised copying.
## Magnetic tape
- Portable cartridges
- A long strip of coated plastic film which is pulled between two reels across read / write heads.
- Patches of the coating are magnetised.
- Accessed sequentially (not random access).

A long strip of coated plastic film. Patches of this coating can be magnetised in either long tracks parallel to the length of the tape, or short tracks slanted across it.

This kind of storage is most useful for backups and archiving since they have a long life, high capacity with low cost, and a high sequential data transfer speed (but high latency for random access, although this is not important for backup media).
## Paper tape
- Very durable, yet easy to destroy
- Can be decoded by humans since the encoding is visible.
- Immune to electric currents and magnetic fields.
- 10-2000 bytes / second data rate.

## Storage Interfaces
In modern standard PCs:
- _**Serial ATA (SATA / eSATA)**_ - Up to 4.8 Gbit/s throughput with SATA 3, half with eSATA.
- _**Universal Serial Bus (USB)**_ - Currently up to 16 Gbit/s max speed wth USB 3.2
- _**PCI Express (PCI-e)**_ - Up to 512 Gbit/s theoretical max with PCI-e 5.0.
- _**mSATA / M.2 (SATA or NVMe interfacing with PCI-e)**_ - 20 Gbit/s.e above.

In Enterprise systems:
- There are many shared standards which include all of the above.
- Infrastructure fro Storage Area Networks (SAN) e.g:
	- Serial-attach SCSI - SAS - Up to 22 Gbit/s.
	- Inertnetl SCSI - iSCSI - Virtual storgae interface, dependent on network speeds, e.g. up to 14 Gbit/s over the Fibre Channel protocol.

Some legacy interfaces which are no longer in widespread use are:
- Parallel ATA - Up to 1 Gbit/s with ATA-4.
- Small Computer Systems Interface (Parallel SCSI) - Up to 2.5 Gbit/s with Ultra-SCSI 4.
- Peripheral Computer Interconnect Express (PCI) - Up to 2 Gbit/s (32 bit), depending on the bus clock.