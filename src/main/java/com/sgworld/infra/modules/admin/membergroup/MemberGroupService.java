package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

public interface MemberGroupService {

	public List<MemberGroup> selectMmList(MemberGroup dto) throws Exception;
}
