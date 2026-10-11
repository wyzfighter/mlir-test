program omp_sections
    use omp_lib
    implicit none
    integer, parameter :: n = 500
    real :: arr1(n), arr2(n)
    integer :: i

    !$omp parallel private(i) shared(arr1, arr2)
        !$omp sections
            !$omp section
                print *, "线程", omp_get_thread_num(), "处理数组1"
                do i = 1, n
                    arr1(i) = cos(real(i) * 0.02)
                end do

            !$omp section
                print *, "线程", omp_get_thread_num(), "处理数组2"
                do i = 1, n
                    arr2(i) = sin(real(i) * 0.02)
                end do
        !$omp end sections
    !$omp end parallel

    print *, "两段独立任务均执行完成"
end program omp_sections