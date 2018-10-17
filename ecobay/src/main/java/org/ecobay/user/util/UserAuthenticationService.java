package org.ecobay.user.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserAuthenticationService implements UserDetailsService{
	
	private SqlSessionTemplate sqlSession;
	
	public UserAuthenticationService() {
	}
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> user = sqlSession.selectOne("org.ecobay.user.mapper.MemberMapper.selectUser", username);
		if(user == null) throw new UsernameNotFoundException(username);
		
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		gas.add(new SimpleGrantedAuthority(user.get("authority").toString()));
		return new UserDetailsVO(user.get("username").toString(), user.get("password").toString(), (boolean)user.get("enabled") == true, true, true, true, gas, user.get("member_name").toString());
	};
	
	
}
