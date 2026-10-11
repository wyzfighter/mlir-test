program omp_critical
    use omp_lib
    implicit none
    integer, parameter :: n = 10
    integer :: i

    !$omp parallel private(i)
        !$omp do
        do i = 1, n
            ! 命名临界区：同一时间仅一个线程可进入
            !$omp critical(print_lock)
                print *, "线程", omp_get_thread_num(), "处理迭代", i
            !$omp end critical(print_lock)
        end do
        !$omp end do
    !$omp end parallel

end program omp_critical