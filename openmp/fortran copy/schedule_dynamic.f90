program omp_schedule_dynamic
    implicit none
    integer, parameter :: n = 1000
    real :: a(n)
    integer :: i

    ! 动态调度：线程按需领取迭代块，块大小为10
    !$omp parallel do schedule(dynamic, 10) private(i) shared(a)
    do i = 1, n
        a(i) = log(real(i) + 1.0)
    end do
    !$omp end parallel do

    print *, "动态调度计算完成，a(100) =", a(100)
end program omp_schedule_dynamic