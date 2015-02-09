module JobFrontHelper
  def job_by_categories
    all_jobs_by_categories = []
    job_categories = JobCategory.all
    job_categories.each do |job_category|
      all_jobs_by_categories << {
          :category_id => job_category.id,
          :category_name => job_category.name,
          :jobs => job_category.jobs
      }
    end
    all_jobs_by_categories
  end
end
