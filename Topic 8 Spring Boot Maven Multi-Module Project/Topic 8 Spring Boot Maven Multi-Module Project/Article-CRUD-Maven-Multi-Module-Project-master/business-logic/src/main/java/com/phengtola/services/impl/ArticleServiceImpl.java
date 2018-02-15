package com.phengtola.services.impl;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
import java.util.List;
import java.util.UUID;

import com.phengtola.domain.Article;
import com.phengtola.domain.filters.ArticleFilter;
import com.phengtola.domain.responses.Pagination;
import com.phengtola.persistence.ArticleRepository;
import com.phengtola.persistence.FileRepository;
import com.phengtola.persistence.TagRepository;
import com.phengtola.services.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ArticleServiceImpl implements ArticleService {
	private ArticleRepository articleRepo;
	private FileRepository fileRepo;
	private TagRepository tagRepo;
	@Autowired
	public  ArticleServiceImpl(ArticleRepository articleRep,FileRepository fileRepo,TagRepository tagRepo ) {
		this.articleRepo = articleRep;
		this.fileRepo = fileRepo;
		this.tagRepo = tagRepo;
	}
	@Override
	@Transactional
	public boolean save(Article article) {
		boolean status = false;
		
		//TODO: Insert Article
		article.setUuid(UUID.randomUUID().toString());
		if( articleRepo.save(article)){
			status = true;
			System.out.println("Article ID "+ article.getId() +" has been inserted!");
			
			// TODO: Insert Files 
			if(article.getFiles() != null){
				if(fileRepo.saveFiles(article.getFiles(),article.getId())){
					System.out.println("This article has "+ article.getFiles().size() + " file(s).");
				}
			}else{
				System.out.println("This article has no file");
			}
			
			// TODO: Insert Tags
			if(article.getTags() != null){
				if(tagRepo.saveTags(article.getTags(), article.getId())){
					System.out.println("This article has "+ article.getTags().size() + " tag(s).");
				}
			}else{
				System.out.println("This article has no tag");
			}
		}
		return status;
	}

	@Override
	public List<Article> findAllArticle(Pagination pagination) {
		return articleRepo.findAllArticle(pagination);
	}

	@Override
	public List<Article> articleFilter(ArticleFilter article) {
		return articleRepo.articleFilter(article);
	}
	@Override
	public int countAllArticle() {
		return articleRepo.countAllArticle();
	}


	
}
