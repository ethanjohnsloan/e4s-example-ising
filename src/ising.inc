C Defines parameters for Ising initialization
C
      INTEGER L
      PARAMETER (L=32)
C
      INTEGER NSPIN
      PARAMETER (NSPIN=L*L)
C
      INTEGER NSTEPS
      PARAMETER (NSTEPS=5000)
C
      INTEGER NPRINT
      PARAMETER (NPRINT=100)
C
      INTEGER NSNAP
      PARAMETER (NSNAP=500)
C
      REAL TEMP
      PARAMETER (TEMP=2.269)
C
      REAL J
      PARAMETER (J=1.0)
C
C Define the spin lattice
C
      INTEGER SPIN(L,L)
C
C Set the random number seed
C
      INTEGER ISEED
C
C Common blocks
C
      COMMON /LATTICE/ SPIN
      COMMON /RNG/ ISEED
