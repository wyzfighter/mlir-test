!===----------------------------------------------------------------------===!
! 3. derived-type scalar firstprivate (the whole object is privatized).
!
! p%v starts at 5 and is incremented by i = 1..5:
!   T=1 -> 6 8 11 15 20
!===----------------------------------------------------------------------===!
module fp_kinds
  implicit none
  type :: pair_t
    integer :: v
  end type pair_t
end module fp_kinds

program fp_derived
  use fp_kinds, only: pair_t
  implicit none
  integer :: i
  type(pair_t) :: p
  p%v = 5
  !$acc parallel loop private(p)
  do i = 1, 5
     p%v = p%v + i
     print '(A,I0)', 'fp_derived ', p%v
  end do
  !$acc end parallel loop
end program fp_derived
