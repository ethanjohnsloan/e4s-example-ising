      SUBROUTINE SNAPSHOT(STEP)

      INCLUDE 'ising.inc'

      INTEGER I, J, STEP
      CHARACTER*40 FNAME
      INTEGER UNIT

      UNIT = 20 + STEP

      WRITE(FNAME,100) STEP
100   FORMAT('../output/spin_',I6.6,'.dat')

      OPEN(UNIT=UNIT, FILE=FNAME, STATUS='UNKNOWN')

      DO I = 1, L
         DO J = 1, L
            WRITE(UNIT,200) I, J, SPIN(I,J)
         END DO
      END DO

200   FORMAT(I4,1X,I4,1X,I2)

      CLOSE(UNIT)

      RETURN
      END
