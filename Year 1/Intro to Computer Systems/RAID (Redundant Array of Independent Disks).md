RAID is a storage virtualisation method which is widely used for enterprise data storage systems. It includes an array consisting of two or more physical disks, but appearing as a single logical storage device to the computer / user.

Compared to a single disk, RAID can:
- Store larger amounts of data
- Provide increased performance
- Increase reliability (no data lost if an individual disk fails)
- Improve availability (usable even when an individual disk fails)

## Techniques
Some of the basic RAID techniques are:
- _**Mirroring**_ - Identical data on two or more disks.
- _**Striping**_ - Each sequential bit, byte or block on a different disk.
- _**Parity**_ - Error checking and correction information stored either with the data or on a dedicated disk.

There are also several levels of RAID, each of which uses a different combination of techniques. For example there are levels 0 through 6, as well as nested combinations such as 0+1, 1+0, 0+3, 5+0, etc...

### Striping
_**RAID 0**_
- Data is distributed across different devices.
- No parity information stored

- No fault tolerance, there will be data loss if one drive fails.
- Read / write performance is somewhat increased.
### Mirroring
_**RAID 1**_
- Multiple copies of data stored on different devices.
- No parity information stored.

- Increased reliability, the data is still available if one drive fails.
- Increased read performance
- Similar write speeds as a single drive, although sometimes a bit less.
### Parity
_**RAID 5**_
- Multiple copies of data stored on different devices.
- Parity information stored across the drives
- Requires at least 3 physical disks but less storage capacity is needed to keep any redundant data.

- Increased reliability, if one drive fails the data can be restored from the parity information stored on the remaining drives.
- Increased read performance
- Lower write speeds, as parity information must be written separately.