#include "hdf5.h"
#include <stdio.h>

#define FILE "ising.h5"

hid_t file_id = -1;
hid_t dataset_id = -1;
hid_t dataspace_id = -1;

void hdf5_init_(int *L, int *NSTEPS)
{
    hsize_t dims[3];

    file_id = H5Fcreate(FILE, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);

    dims[0] = *NSTEPS;
    dims[1] = *L;
    dims[2] = *L;

    dataspace_id = H5Screate_simple(3, dims, NULL);

    dataset_id = H5Dcreate(file_id, "/spins",
                           H5T_NATIVE_INT,
                           dataspace_id,
                           H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
}

void snapshot_hdf5_(int *step, int *L, int spin[*L][*L])
{
    hsize_t start[3], count[3];
    hid_t memspace;

    start[0] = *step;
    start[1] = 0;
    start[2] = 0;

    count[0] = 1;
    count[1] = *L;
    count[2] = *L;

    memspace = H5Screate_simple(3, count, NULL);

    H5Sselect_hyperslab(dataspace_id, H5S_SELECT_SET,
                        start, NULL, count, NULL);

    H5Dwrite(dataset_id, H5T_NATIVE_INT,
             memspace, dataspace_id,
             H5P_DEFAULT, spin);

    H5Sclose(memspace);
}

void hdf5_close_()
{
    H5Dclose(dataset_id);
    H5Sclose(dataspace_id);
    H5Fclose(file_id);
}
