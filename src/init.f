      SUBROUTINE INIT

C Initialize Ising model spin config
C
      INCLUDE 'ising.inc'
C
      INTEGER I,J
      REAL R
      REAL RANF
C
C Initialize random number generator seed
C
      CALL RANSET
C
      DO 20 I=1, L
         DO 10 J=1, L
            R = RANF()
            IF (R .LT. 0.5) THEN
               SPIN(I,J)=-1
            ELSE
               SPIN(I,J)=1
            ENDIF
 10      CONTINUE
 20   CONTINUE
C
      RETURN
      END
