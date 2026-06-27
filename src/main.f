      PROGRAM ISING
C
C Driver program for a very simple 2D Ising model!
C
      INCLUDE 'ising.inc'
C
      INTEGER STEP
      REAL E
      REAL M
C
C Initialize
C
      CALL INIT
C
C Monte Carlo loop
C
      DO 100 STEP=1,NSTEPS
C
       CALL SWEEP
C
       CALL ENERGY(E)
C
       CALL MAGNETIZATION(M)
C
       IF (MOD(STEP,25) .EQ. 0) THEN
          CALL SNAPSHOT(STEP)
       ENDIF
C
 100  CONTINUE
C
      STOP
      END
