!===----------------------------------------------------------------------===!
! Plain OpenMP twin of fp_derived.f90.
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
  !$omp parallel do private(p)
  do i = 1, 5
     p%v = p%v + i
     print '(A,I0)', 'fp_derived ', p%v
  end do
  !$omp end parallel do
end program fp_derived
