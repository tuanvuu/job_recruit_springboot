package com.laptrinhoop.dao.impl;

import com.laptrinhoop.dao.IRoleDAO;
import com.laptrinhoop.entity.Role;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDAO extends GeneraDAO<Role, Integer> implements IRoleDAO {
}
