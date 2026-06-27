      SUBROUTINE SWEEP
C Metropolis algorithm (Monte Carlo)
C
      INCLUDE 'ising.inc'
C
      INTEGER I,J,N
      INTEGER IM, IP, JM, JP
      REAL R, RANF, DE, BETA
C
      EXTERNAL RANF
C
      BETA = 1.0/TEMP
C
C Spin updates
C
      DO 100 N=1, L*L
         I = INT(RANF()*L)+1
         J = INT(RANF()*L)+1
C        Periodic BCs
         IP = I + 1
         IM = I - 1
         JP = J + 1
         JM = J - 1
         IF (IP .GT. L) IP=1
         IF (IM .LT. 1) IM=L
         IF (JP .GT. L) JP=1
         IF (JM .LT. 1) JM=L
C        Compute energy change
         DE = 2.0*SPIN(I,J)*
     $        (SPIN(IP,J) + SPIN(IM,J) +
     $        SPIN(I,JP) + SPIN(I,JM))
         IF (DE .LE. 0.0) THEN
            SPIN(I,J)=-SPIN(I,J)
         ELSE
            R = RANF()
            IF (R .LT. EXP(-BETA*DE)) THEN
               SPIN(I,J) = -SPIN(I,J)
            ENDIF
         ENDIF
 100  CONTINUE
C
      RETURN
      END
