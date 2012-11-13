cdef extern from "include/dcdplugin.h":
    ctypedef struct dcdhandle:
        pass
    
    dcdhandle* open_dcd_read(char *path, char *filetype, int *natoms, int* nsets)
    int read_next_timestep(dcdhandle *v, int natoms, molfile_timestep_t *ts)
    void close_file_read(dcdhandle *v)
    
    dcdhandle* open_dcd_write(char *path, char *filetype, int natoms)
    int write_timestep(dcdhandle *v, molfile_timestep_t *ts)
    void close_file_write(dcdhandle *v)
    
    
cdef extern from "include/molfile_plugin.h":
    ctypedef struct molfile_timestep_t:
      float *coords  # coordinates of all atoms, arranged xyzxyzxyz
      float *velocities  # space for velocities of all atoms; same layout
      float A, B, C, alpha, beta, gamma
