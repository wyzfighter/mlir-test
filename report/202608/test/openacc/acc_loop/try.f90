program main
  implicit none
  integer :: i
  !$acc parallel loop
  do i = 1, 100
  end do
  !$acc end parallel loop
end program