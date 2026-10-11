program main
  implicit none
  integer :: i

  !$omp parallel do
  do i = 1, 100
  end do
  !$omp end parallel do
end program