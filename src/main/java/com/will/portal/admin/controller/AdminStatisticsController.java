package com.will.portal.admin.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.portal.common.ScoreChartSearchVO;
import com.will.portal.statistics.model.StatisticsService;

@Controller
@RequestMapping("/admin/statistics")
public class AdminStatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(AdminStatisticsController.class);
	@Autowired
	private StatisticsService statisticsService;

	/**
	 * 통계 메인 페이지
	 * 
	 * @param model
	 */
	@RequestMapping("/statisticsMain")
	public void statisticsMain(Model model) {
		logger.info("statisticsMain");

		// 첫번째 통계 - 학과별 점수 랭킹
		List<Map<String, Object>> scoreList = statisticsService.selectScoreMain();
		logger.info("{}", scoreList);

		List<String> depListCh = new ArrayList<String>();
		for (Map<String, Object> map : scoreList) {
			depListCh.add("\"" + (String) map.get("DEP_NAME") + "\"");
		}
		logger.info("depListCh={}", depListCh);

		List<Double> scoreListCh = new ArrayList<Double>();
		for (Map<String, Object> map : scoreList) {
			scoreListCh.add(Double.parseDouble(map.get("avg").toString()));
		}
		logger.info("scoreListCh={}", scoreListCh);

		double min = Collections.min(scoreListCh);

		model.addAttribute("scoreList", scoreList);
		model.addAttribute("depListCh", depListCh);
		model.addAttribute("scoreListCh", scoreListCh);
		model.addAttribute("min", min);

		// 두번째 통계 - 인기 게시판
		List<Map<String, Object>> boardList = statisticsService.selectBoardMain();
		logger.info("{}", boardList);

		List<String> boardListCh = new ArrayList<String>();
		for (Map<String, Object> map : boardList) {
			boardListCh.add("\"" + (String) map.get("BD_NAME") + "\"");
		}
		logger.info("boardListCh={}", boardListCh);

		List<Integer> countListCh = new ArrayList<Integer>();
		for (Map<String, Object> map : boardList) {
			countListCh.add(Integer.parseInt(map.get("COUNT").toString()));
		}
		logger.info("countListCh", countListCh);

		model.addAttribute("boardList", boardList);
		model.addAttribute("boardListCh", boardListCh);
		model.addAttribute("countListCh", countListCh);
	}

	/**
	 * 학과별 통계
	 * @param scoreChartSearchVo
	 * @param model
	 */
	@RequestMapping("/statisticsScore")
	public void statisticsScore(@ModelAttribute ScoreChartSearchVO scoreChartSearchVo, Model model) {
		logger.info("statisticsScore, {}", scoreChartSearchVo);

		// 첫번째 통계 - 학과별 점수 랭킹
		String type = scoreChartSearchVo.getType();
		List<Map<String, Object>> scoreList = new ArrayList<Map<String, Object>>();
		if (type == null || type.isEmpty() || type.equals("1")) {
			scoreList = statisticsService.selectScoreAvg(scoreChartSearchVo);
		} else if (type.equals("2")) {
			scoreList = statisticsService.selectScoreMed(scoreChartSearchVo);
		}
		logger.info("{}", scoreList);

		List<String> depListCh = new ArrayList<String>();
		List<Double> scoreListCh = new ArrayList<Double>();
		double min = 0.0;
		if (scoreList.size() > 0) {

			for (Map<String, Object> map : scoreList) {
				depListCh.add("\"" + (String) map.get("DEP_NAME") + "\"");
			}
			logger.info("depListCh={}", depListCh);

			for (Map<String, Object> map : scoreList) {
				scoreListCh.add(Double.parseDouble(map.get("avg").toString()));
			}
			logger.info("scoreListCh={}", scoreListCh);

			min = Collections.min(scoreListCh);
		}
		model.addAttribute("scoreList", scoreList);
		model.addAttribute("depListCh", depListCh);
		model.addAttribute("scoreListCh", scoreListCh);
		model.addAttribute("min", min);

		// 학기 조회
		List<String> slist = statisticsService.selectChartSemester();
		logger.info("slist={}", slist);

		List<String> slist2 = new ArrayList<String>();
		String sort = "";
		for (String sem : slist) {
			if (sem.substring(sem.length() - 1).equals("2")) {
				sort = "/1학기";
			} else if (sem.substring(sem.length() - 1).equals("8")) {
				sort = "/2학기";
			}
			slist2.add(sem.substring(0, 4) + sort);
		}
		logger.info("slist2={}", slist2);

		model.addAttribute("slist", slist);
		model.addAttribute("slist2", slist2);
	}

}
