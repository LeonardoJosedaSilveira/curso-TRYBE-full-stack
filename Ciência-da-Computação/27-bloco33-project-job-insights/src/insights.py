from src.jobs import read


def get_unique_job_types(path):
    jobs_list = read(path)
    jobs_around = set()

    for jobs in jobs_list:
        jobs_around.add(jobs['job_type'])

    return jobs_around

    """Checks all different job types and returns a list of them

    Must call `read`

    Parameters
    ----------
    path : str
        Must be passed to `read`

    Returns
    -------
    list
        List of unique job types
    """


def filter_by_job_type(jobs, job_type):
    job_list = []

    for job in jobs:
        if (job['job_type'] == job_type):
            job_list.append(job)
    return job_list

    """Filters a list of jobs by job_type

    Parameters
    ----------
    jobs : list
        List of jobs to be filtered
    job_type : str
        Job type for the list filter

    Returns
    -------
    list
        List of jobs with provided job_type
    """


def get_unique_industries(path):
    jobs_list = read(path)
    jobs_around = set()

    for jobs in jobs_list:
        if (jobs['industry'] != ''):
            jobs_around.add(jobs['industry'])

    return jobs_around

    """Checks all different industries and returns a list of them

    Must call `read`

    Parameters
    ----------
    path : str
        Must be passed to `read`

    Returns
    -------
    list
        List of unique industries
    """


def filter_by_industry(jobs, industry):
    job_list = []

    for job in jobs:
        if (job['industry'] == industry):
            job_list.append(job)
    return job_list

    """Filters a list of jobs by industry

    Parameters
    ----------
    jobs : list
        List of jobs to be filtered
    industry : str
        Industry for the list filter

    Returns
    -------
    list
        List of jobs with provided industry
    """


def get_max_salary(path):
    jobs_list = read(path)
    jobs_around = set()

    for jobs in jobs_list:
        if (jobs['max_salary'].isdigit()):
            jobs_around.add(int(jobs['max_salary']))

    job_max_value = max(jobs_around, key=int)
    return job_max_value

    """Get the maximum salary of all jobs

    Must call `read`

    Parameters
    ----------
    path : str
        Must be passed to `read`

    Returns
    -------
    int
        The maximum salary paid out of all job opportunities
    """


def get_min_salary(path):
    jobs_list = read(path)
    jobs_around = set()

    for jobs in jobs_list:
        if (jobs['min_salary'].isdigit()):
            jobs_around.add(int(jobs['min_salary']))

    job_min_value = min(jobs_around, key=int)
    return job_min_value
    """Get the minimum salary of all jobs

    Must call `read`

    Parameters
    ----------
    path : str
        Must be passed to `read`

    Returns
    -------
    int
        The minimum salary paid out of all job opportunities
    """


def matches_salary_range(job, salary):
    if not ((
        isinstance(job.get('min_salary'), int)
        and isinstance(job.get('max_salary'), int))
    ):
        raise ValueError('Problemas com tipo de min e max sal')
    if not isinstance(salary, int):
        raise ValueError('Problemas com tipo do salary')
    if (
        'min_salary' not in job
        and 'max_salary' not in job
    ):
        raise ValueError('Problemas com ausensia de min ou max sal')
    if job['min_salary'] > job['max_salary']:
        raise ValueError('Problemas com min maior que max')
    check = int(job['min_salary']) <= salary <= int(job['max_salary'])

    return check

    """Checks if a given salary is in the salary range of a given job

    Parameters
    ----------
    job : dict
        The job with `min_salary` and `max_salary` keys
    salary : int
        The salary to check if matches with salary range of the job

    Returns
    -------
    bool
        True if the salary is in the salary range of the job, False otherwise

    Raises
    ------
    ValueError
        If `job["min_salary"]` or `job["max_salary"]` doesn't exists
        If `job["min_salary"]` or `job["max_salary"]` aren't valid integers
        If `job["min_salary"]` is greather than `job["max_salary"]`
        If `salary` isn't a valid integer
    """


# nao ia fazer os if tudo de novo entao usei try
def filter_by_salary_range(jobs, salary):
    job_list = []

    for job in jobs:
        try:
            if (matches_salary_range(job, salary)):
                job_list.append(job)
        except Exception:
            print('nao funfa')

    return job_list

    """Filters a list of jobs by salary range

    Parameters
    ----------
    jobs : list
        The jobs to be filtered
    salary : int
        The salary to be used as filter

    Returns
    -------
    list
        Jobs whose salary range contains `salary`
    """
