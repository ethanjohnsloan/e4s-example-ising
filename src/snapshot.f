      SUBROUTINE SNAPSHOT(STEP)
C
C Spin configs into CSV file for plotting in Python (i,j,s(ij))
C
      INCLUDE 'ising.inc'
C
      INTEGER I,J,STEP
      CHARACTER*20 FNAME
      INTEGER UNIT
C
C Writes a snapshot file only occasionally
C
      IF (MOD(STEP,NSNAP) .NE. 0) RETURN
C
C Create the filename
C
      WRITE(FNAME,100) STEP
 100  FORMAT('spin_',I6.6,'.dat')
C
      UNIT=20+MOD(STEP,10)
      OPEN(UNIT,FILE=FNAME,STATUS='UNKNOWN')
C
C Write the lattice file
C
      DO 20 I=1,L
         DO 10 J=1,L
            WRITE(UNIT,*) I, J, SPIN(I,J)
 10      CONTINUE
 20   CONTINUE
C
      CLOSE(UNIT)
C
      RETURN
      END
