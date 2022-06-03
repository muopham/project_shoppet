package com.devpro.shoppet.service;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shoppet.dto.ProductSearchModel;
import com.devpro.shoppet.entities.Blog;
import com.github.slugify.Slugify;

@Service
public class BlogService extends BaseService<Blog>{
		
	@Override
	protected Class<Blog> clazz() {
		// TODO Auto-generated method stub
		return Blog.class;
	}
	
	public PagerData<Blog> search(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_blog p WHERE 1=1";

		if (searchModel != null) {
			
			//tìm theo seo
			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo = '" + searchModel.seo + "'";
			}			
		}

		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
	
	
	
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	@Transactional
	public Blog add(Blog b, MultipartFile blogAvatar)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(blogAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = "C:/upload/blog/" + blogAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			blogAvatar.transferTo(new File(pathToFile));

			b.setAvatar("blog/" + blogAvatar.getOriginalFilename());
		}

		// có đẩy pictures(product_images) ???
		

		//tạo seo
		b.setSeo(new Slugify().slugify(b.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(b);		
	}
	
	@Transactional
	public Blog update(Blog b, MultipartFile blogAvatar)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Blog blogInDB = super.getById(b.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(blogAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + blogInDB.getAvatar()).delete();

			// add avartar moi
			blogAvatar.transferTo(new File("C:/upload/blog/" + blogAvatar.getOriginalFilename()));
			b.setAvatar("blog/" + blogAvatar.getOriginalFilename());
		} 
		else {
			// su dung lai avatar cu
			b.setAvatar(blogInDB.getAvatar());
		}

		//tạo seo
		b.setSeo(new Slugify().slugify(b.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(b);
	}
}
