#ifndef TEMPNAME_HPP
# define TEMPNAME_HPP

class Tempname
{
	private:
	public:
		Tempname(void);
		Tempname(Tempname const &tempname);
		~Tempname(void);
		Tempname	&operator=(Tempname const &tempname);
};
#endif
