      SUBROUTINE MAGNETIZATION(M)
C Computes the total magnetization per spin
C
      INCLUDE 'ising.inc'
C
      INTEGER I, J
      REAL M
      INTEGER SUM
C
C Total spin, sum
C
      SUM = 0
      DO 20 I=1,L
         DO 10 J=1,L
            SUM = SUM + SPIN(I,J)
 10      CONTINUE
 20   CONTINUE
C
C Normalize by number of spins
C
      M = FLOAT(SUM)/FLOAT(L*L)
C
      RETURN
      END
