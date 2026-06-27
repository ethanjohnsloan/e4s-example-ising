      SUBROUTINE ENERGY(E)
C Global energy state of the lattice
C
      INCLUDE 'ising.inc'
C
      INTEGER I,J
      INTEGER IP,JP
      REAL E
C
C Initialize energy
C
      E=0.0
C Loop over all lattice sites
C
      DO 20 I=1,L
         DO 10 J=1,L
            IP = I+1
            IF (IP .GT. L) IP=1
            JP = J+1
            IF (JP .GT. L) JP=1
            E = E - JCOUP*SPIN(I,J)*SPIN(IP,J)
            E = E - JCOUP*SPIN(I,J)*SPIN(I,JP)
 10      CONTINUE
 20   CONTINUE
C
      RETURN
      END
