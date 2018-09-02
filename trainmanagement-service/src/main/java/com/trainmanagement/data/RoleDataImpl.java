package com.trainmanagement.data;

import com.trainmanagement.dto.RoleDto;
import com.trainmanagement.pojo.Role;
import com.trainmanagement.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class RoleDataImpl implements RoleData {

    @Autowired
    RoleRepository roleRepository;

    @Override
    public List<Role> getAll() {
        return roleRepository.findAll();
    }

    @Override
    public Role save(Role role) {
        return roleRepository.saveAndFlush(role);
    }

    @Override
    public void deleteRole(Integer id){
        roleRepository.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<RoleDto> getRoleDTO() {
        List<RoleDto> roleDTOs = new ArrayList<>();
        for (Role role : getAll()) {
            roleDTOs.add(constructRoleDTO(role));
        }
        return roleDTOs;
    }

    private RoleDto constructRoleDTO(Role role) {
        RoleDto roleDTO = new RoleDto();
        roleDTO.setId(role.getId());
        roleDTO.setRole(role.getRole());
        return roleDTO;
    }
}
