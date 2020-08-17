package com.will.portal.subj_eval.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class AllSubjAvgVO {
	private String subCode;
	private String subjName;
	private SubjAvgVO subjAvgVO;
	private List<Subj_evalVO> subjList;
}
