program omp_single
    use omp_lib
    implicit none
    integer, parameter :: n = 100
    real :: data(n)
    integer :: i

    !$omp parallel private(i) shared(data)
        ! 仅由任意一个线程执行初始化，其余线程等待
        !$omp single
            print *, "由线程", omp_get_thread_num(), "执行全局初始化"
            do i = 1, n
                data(i) = 0.0
            end do
        !$omp end single

        ! 所有线程共同参与计算
        !$omp do
        do i = 1, n
            data(i) = data(i) + real(i)
        end do
        !$omp end do
    !$omp end parallel

    print *, "计算完成，data(10) =", data(10)
end program omp_single