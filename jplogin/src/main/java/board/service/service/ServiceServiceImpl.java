package board.service.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.service.dao.ServiceDao;
import board.service.domain.ServiceVO;
import syspage.paging.SearchCriteria;

@Service
public class ServiceServiceImpl implements ServiceService{

	private ServiceDao serviceDao;

	public void setServiceDao(ServiceDao serviceDao) {
		this.serviceDao = serviceDao;
	}
	
	// 게시글 작성
		@Override
		public void write(ServiceVO serviceVO) throws Exception {
			serviceDao.write(serviceVO);
		}

		// 게시물 목록 조회
		@Override
		public List<ServiceVO> list(SearchCriteria scri) throws Exception {

			return serviceDao.list(scri);
		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			
			return serviceDao.listCount(scri);
		}
		
		// 게시물 목록 조회
		@Override
		public ServiceVO read(int SCNUM) throws Exception {

			return serviceDao.read(SCNUM);
		}
		
		@Override
		public void update(ServiceVO serviceVO) throws Exception {

			serviceDao.update(serviceVO);
		}

		@Override
		public void delete(int SCNUM) throws Exception {
			
			serviceDao.delete(SCNUM);
		}

	
}
