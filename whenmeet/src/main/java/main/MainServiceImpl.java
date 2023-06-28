package main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAO dao;
	
	public List<String> myApplication(String user_id){
		return dao.myApplication(user_id);
	};
	public List<String> myWrite(String user_id){
		return dao.myWrite(user_id);
	};
	public List<String> myGroup(String user_id){
		return dao.myGroup(user_id);
	};
	public List<String> rankList(){
		return dao.rankList();
	}
}