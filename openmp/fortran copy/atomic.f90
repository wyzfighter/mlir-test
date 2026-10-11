program omp_atomic
    implicit none
    integer, parameter :: n = 1000
    integer :: counter
    integer :: i

    counter = 0

    !$omp parallel do private(i) shared(counter)
    do i = 1, n
        ! 原子更新：保护共享变量的累加，避免数据竞争
        !$omp atomic update
            counter = counter + 1
    end do
    !$omp end parallel do

    print *, "最终计数器值（应为1000）：", counter
end program omp_atomic