1. $B=log_2(s)$, where $B$ is the number of bits, and $s$ is the number of states.
2. 
	1. $6\times 6=36\rightarrow log_2(36)=5\ldots$, so we may store more than 5 bits, but less than 6 bits with two six sided dice.
	2. So we have $26\times 2=52$ letters, $10$ decimal digits, and a full stop and comma tile, so in total the bag contains $(26\times 2)+10+2=64$ tiles. We are choosing a single tile from the collection, so the number of states we may choose is $64$, hence the number of bits which may be represented in this way is $log_2(64)=6$.
	3. Each tile in the row has one less possible state, because one tile will have been used previously. This means that the total number of permutations is $4\times 3\times 2\times 1=24\rightarrow B=log_2(24)\rightarrow 4\leq B\leq 5$.
	4. This should simply be $1\times 10^9$ bits, which would equate to $1$ Gbits.
3. $2^8=256$, so a system with 8 bits of storage may store 256 states.
4. 
	1. The Lab computer's C drive has a capacity of 943 GB, and is stored on a local disk. This local disk is a NVMe drive, which is a storage protocol used in Solid State Drives. Since it is a local disk it will likely be contained within the PC housing.
	2. The Home share drive appears to be used as a remote access drive, which allows students to store data and access it wherever they have access to it. It takes the form of a usual windows user directory. The teaching share is probably used to store teaching resources, students are clearly not given access to this. These drives will be stored in a remote location, attached to some kind of server / data centre.
	3. The CPU on the Lab computers is running at 2.4 GHz, this gives $2.4\times 10^9$ instructions per second, per core running at this speed. There are 16 cores on the CPU chip.
	4. There are 64 GB of RAM, this equates to $64\times 1024^{3}$ bytes, so dividing $\frac{64\times 1024^3}{2.4\times 10^9}$ will give the number of seconds required, $\rightarrow 28.63$ seconds.
	5. $32\times 44100=1411200\rightarrow \frac{1411200}{8}=176400$ bytes per second of music, so $floor(\frac{64\times 1024^3}{176400})=389566$ seconds of music $\rightarrow 6492$ minutes of music.


