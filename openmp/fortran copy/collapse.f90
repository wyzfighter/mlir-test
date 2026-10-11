program omp_collapse
    implicit none
    integer, parameter :: row = 200, col = 200
    real :: mat_a(row, col), mat_b(row, col), mat_c(row, col)
    integer :: i, j

    ! 初始化矩阵
    do j = 1, col
        do i = 1, row
            mat_a(i,j) = real(i + j)
            mat_b(i,j) = real(i - j)
        end do
    end do

    ! collapse(2) 将两层循环融合为一层并行，提升并行粒度
    !$omp parallel do collapse(2) private(i, j) shared(mat_a, mat_b, mat_c)
    do j = 1, col
        do i = 1, row
            mat_c(i,j) = mat_a(i,j) + mat_b(i,j)
        end do
    end do
    !$omp end parallel do

    print *, "矩阵加法完成，mat_c(10,10) =", mat_c(10,10)
end program omp_collapse