program omp_shared
    implicit none
    integer, parameter :: n = 500
    real :: input_arr(n), output_arr(n)
    integer :: i

    ! 初始化输入数组
    do i = 1, n
        input_arr(i) = real(i)
    end do

    ! 显式声明 shared，与 OpenMP 默认行为一致
    !$omp parallel do shared(input_arr, output_arr) private(i)
    do i = 1, n
        output_arr(i) = input_arr(i) * 2.0
    end do
    !$omp end parallel do

    print *, "共享变量计算完成，output_arr(10) =", output_arr(10)
end program omp_shared