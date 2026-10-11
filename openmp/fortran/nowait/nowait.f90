program omp_nowait
    implicit none
    integer, parameter :: n = 1000
    real :: a(n), b(n)
    integer :: i

    !$omp parallel private(i) shared(a, b)
        ! 第一个循环：加 nowait 取消结束后的同步屏障
        !$omp do schedule(static) nowait
        do i = 1, n
            a(i) = real(i) * 2.0
        end do
        !$omp end do

        ! 第二个循环：线程完成上一循环后直接开始，无需等待所有线程
        !$omp do schedule(static)
        do i = 1, n
            b(i) = a(i) + 1.0
        end do
        !$omp end do
    !$omp end parallel

    print *, "nowait 测试完成，b(500) =", b(500)
end program omp_nowait