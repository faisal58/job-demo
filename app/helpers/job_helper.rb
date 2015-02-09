module JobHelper

  def find_open_jobs(jobs)
    open_jobs = []
    jobs.each do |job|
      if job.application_deadline > Time.now
        open_jobs << job
      end
    end
    open_jobs
  end

  def application_count_by_job(job)
    job.job_applications.count
  end

end
