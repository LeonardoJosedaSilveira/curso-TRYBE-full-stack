from functools import lru_cache
from csv import DictReader


@lru_cache
def read(path):
    with open(path, 'r', encoding='utf8') as csvfile:
        spamreader = DictReader(csvfile)
        return [rows for rows in spamreader]
    """Reads a file from a given path and returns its contents

    Parameters
    ----------
    path : str
        Full path to file

    Returns
    -------
    list
        List of rows as dicts
    """
