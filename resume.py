import yaml
import jinja2
import os


def format_date(date, fmt='%Y-%m-%d'):
    try:
        return date.strftime(fmt)
    except AttributeError:
        return date


with open('resume.yaml') as f:
    r = yaml.load(f)

latex_env = jinja2.Environment(
    block_start_string='\BLOCK{',
    block_end_string='}',
    variable_start_string='\VAR{',
    variable_end_string='}',
    comment_start_string='\#{',
    comment_end_string='}',
    line_statement_prefix='%%',
    line_comment_prefix='%#',
    trim_blocks=True,
    autoescape=False,
    loader=jinja2.FileSystemLoader(os.path.abspath('.'))
)

latex_env.filters['format_date'] = format_date

template = latex_env.get_template('resume-template.tex')

print(template.render(**r))
