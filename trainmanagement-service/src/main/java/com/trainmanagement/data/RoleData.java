package com.trainmanagement.data;


import com.trainmanagement.dto.RoleDto;
import com.trainmanagement.pojo.Role;

import java.util.List;

public interface RoleData {
    List<Role> getAll();

    List<RoleDto> getRoleDTO();

    Role save(Role role);

    void deleteRole(Integer id);
}
