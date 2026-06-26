      SUBROUTINE OUTPUT(STEP,E,M)
C Prints Monte Carlo step, energy, and magnetization
C
      INTEGER STEP
      REAL E, M
C
C Print NPRINT steps
C
      INCLUDE 'ising.inc'
      IF (MOD(STEP,NPRINT) .EQ. 0) THEN
         WRITE(*,100) STEP,E,M
      ENDIF
 100  FORMAT(I8,2X,F12.6,2X,F12.6)
C
      RETURN
      END
