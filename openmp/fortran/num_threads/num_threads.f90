program omp_num_threads
    use omp_lib
    implicit none
    integer, parameter :: n = 500
    real :: arr(n)
    integer :: i

    ! 强制指定使用 4 个线程执行并行区域
    !$omp parallel do num_threads(4) private(i) shared(arr)
    do i = 1, n
        arr(i) = sin(real(i) * 0.01)
    end do
    !$omp end parallel do

    print *, "计算完成，最大线程数：", omp_get_max_threads()
end program omp_num_threads