
## 题目大意

除了基本运算，主要有三种语法需要解释：define，cond，lambda。
难点在与cond与lambda的互相嵌套
除此之外还有很多骚操作，包括但不限于：

#### （1）lambda参数名与关键字重复，例：(取某样例的某一条语句的一部分）
```
(lambda (* define eq?) (/ (+ * define) eq?))
```

#### （2）自己是自己定义的一部分，例：（函数1fact功能是计算n！）
```
(define 1fact (lambda (n) (cond ((eq? n 1) 1) (True (* n (1fact (- n 1)))))))
(1fact 1)
(1fact 5)
```

#### （3）定义的过程中出现了此前曾为出现的元素，例：（第一句出现的2fun2是第二句定义的）
```
(define 1fun1 (lambda (x) (cond ((eq? x 0) 1) (True (2fun2 (- x 1))))))
(define 2fun2 (lambda (x) (cond ((eq? x 0) 2) (True (1fun1 (/ x 2))))))
```

#### （4）定义的函数返回值也可能是函数，例：（第二句结果为60）
```
(define 666kk (lambda (x1) (lambda (x2 x3) (+ x1 (+ x2 x3)))))
((666kk 10) 20 30)
```

## 解题方法

### 方法一：（官方给出的python解法）

思路：充分利用python特性，先将关键字与基本运算存入全局变量中，处理语句时，每读入一条语句，先将这条语句转换成tuple，每个括号的内部所有元素是一个tuple元素，同时将语句中的数字转换成int，例如:
```
(define 1sqr+y (lambda (x) (+ 1y (* x x))))
(define 1y 10)
```

转换成tuple：
```
('define', '1sqr+y', ('lambda', ('x',), ('+', '1y', ('*', 'x', 'x'))))
('define', '1y', 10)
```

处理之后，每次只要从tuple中pop出一个元素进行计算就可以了，处理过程中如果又遇到了tuple，则调用此方法递归计算。
遇到define语句，tuple中第二个元素为name，对第三个元素进行计算，计算的结果作为值，name作为key存到字典中作为全局变量。
遇到cond语句，依次计算每个tuple的第一个元素，若该元素不为False，则将该tuple的第二个元素的计算结果返回，结束处理。
遇到lambda语句，tuple中第二个元素为参数列表，第三个元素为计算过程，定义新类型直接存即可，等调用的时候直接计算
遇到普通计算语句（基本计算或使用已定义的函数计算），tuple中第一个元素为函数，之后的所有元素为参数，则直接计算

代码：
```
import operator
import sys


def convert_bool(func):
    def converted(*args, **kwargs):
        result = func(*args, **kwargs)
        return 'True' if result else 'False'
    return converted


class Lambda:

    def __init__(self, params, body, env, interpreter):
        self.params = params
        self.body = body
        self.env = env
        self.interpreter = interpreter

    def __str__(self):
        return f'Lambda{self.params} {self.body}'

    def __call__(self, *args):
        env = self.env.copy()
        for param, arg in zip(self.params, args):
            env[param] = arg
        return self.interpreter.evaluate(self.body, env)


class Interpreter:

    def __init__(self):
        self.env = {}
        self.env['False'] = 'False'
        self.env['True'] = 'True'
        self.env['+'] = operator.add
        self.env['-'] = operator.sub
        self.env['*'] = operator.mul
        self.env['/'] = lambda x, y: x // y if isinstance(x, int) and isinstance(y, int) else x / y
        self.env['eq?'] = convert_bool(operator.eq)

    def parse(self, line):
        tokens = line.replace('(', ' ( ').replace(')', ' ) ').split()
        stack = []
        stack.append([])
        for token in tokens:
            if token == '(':
                stack.append([])
            elif token == ')':
                top = tuple(stack.pop())
                stack[-1].append(top)
            else:
                atom = self.parse_atom(token)
                stack[-1].append(atom)
        return stack[-1][0]

    def evaluate(self, expr, env=None):
        if env is None:
            env = self.env
        if not isinstance(expr, tuple):
            return env.get(expr, 'False') if isinstance(expr, str) else expr
        if not expr:
            return expr  # empty list
        action = expr[0]
        if isinstance(action, str):
            name = 'macro_' + action
            if hasattr(self, name):
                return getattr(self, name)(env, *expr[1:])
        # function application
        func = self.evaluate(action, env)
        args = [self.evaluate(arg, env) for arg in expr[1:]]
        return func(*args)

    def parse_atom(self, token):
        try:
            atom = int(token)
        except ValueError:
            atom = token
        return atom

    def macro_define(self, env, name, value):
        value = self.evaluate(value, env)
        self.env[name] = value
        return 'define'

    def macro_lambda(self, env, params, body):
        return Lambda(params, body, env, self)

    def macro_cond(self, env, *clauses):
        for cond, body in clauses:
            test = self.evaluate(cond, env)
            if test is not 'False':
                return self.evaluate(body, env)
        return 'False'


def main():
    # program = sys.stdin.readlines()
    interpreter = Interpreter()
    for line in sys.stdin:
        expr = interpreter.parse(line.strip())
        #sys.stderr.write(f'# {expr}\n')
        result = interpreter.evaluate(expr)
        sys.stdout.write(f'{result}\n')

if __name__ == '__main__':
    main()

```

### 方法二：（官方给出的C++解法），没看懂

运行速度很慢，计算样例10需要时间：370.475ms

代码：
```
// oj.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include "pch.h"
#include <iostream>
#include <memory>
#include <sstream>
#include <stack>
#include <string>
#include <unordered_map>
#include <vector>

bool IsNumber(const std::string& str) {
	for (char ch : str) {
		if (!(ch >= '0' && ch <= '9')) {
			return false;
		}
	}
	return true;
}

class Expression;

typedef std::shared_ptr<Expression> ExprPtr;
typedef std::unordered_map<std::string, ExprPtr> ExprMap;
typedef std::vector<ExprPtr> ExprList;

class Expression : public std::enable_shared_from_this<Expression> {
public:
	Expression() {}
	virtual ~Expression() {}
	virtual std::string ToString() const = 0;
	virtual ExprPtr Evaluate(ExprMap& env) = 0;
	virtual ExprPtr Apply(ExprList args, ExprMap env) const { return nullptr; }
	virtual ExprPtr Substitute(ExprMap env) { return shared_from_this(); }
	virtual bool IsAtom() const { return false; }
	virtual bool Equals(ExprPtr other) const { return false; }

	const static ExprPtr kFalse;
	const static ExprPtr kTrue;
protected:
};

class Atom : public Expression {
public:
	Atom(const std::string& value = "") : value_(value) {}
	virtual ~Atom() {}
	virtual std::string ToString() const override { return value_; }
	virtual ExprPtr Evaluate(ExprMap& env) override {
		if (IsNumber(value_)) {
			return Expression::Substitute(env);
		}
		else {
			return Substitute(env);
		}
	}
	virtual ExprPtr Apply(ExprList args, ExprMap env) const override;
	virtual ExprPtr Substitute(ExprMap env) override {
		auto item = env.find(value_);
		if (item != env.end()) {
			return item->second;
		}
		else {
			return Expression::Substitute(env);
		}
	}
	virtual bool IsAtom() const override { return true; }
	virtual bool Equals(ExprPtr other) const override {
		auto other_atom = std::dynamic_pointer_cast<Atom>(other);
		return other_atom && value_ == other_atom->value_;
	}
protected:
	std::string value_;
};

class List : public Expression {
public:
	List() : values_() {}
	List(ExprList values) : values_(values) {}
	virtual ~List() {}
	virtual std::string ToString() const override {
		std::ostringstream string;
		string << "(";
		bool first = true;
		for (ExprPtr value : values_) {
			if (first) {
				first = false;
			}
			else {
				string << " ";
			}
			string << value->ToString();
		}
		string << ")";
		return string.str();
	}
	virtual ExprPtr Evaluate(ExprMap& env) override;
	virtual ExprPtr Apply(ExprList args, ExprMap env) const override;
	virtual ExprPtr Substitute(ExprMap env) override;
	virtual bool Equals(ExprPtr other) const override {
		auto other_list = std::dynamic_pointer_cast<List>(other);
		if (!other_list) {
			return false;
		}
		if (values_.size() != other_list->values_.size()) {
			return false;
		}
		for (int i = 0; i < values_.size(); i++) {
			if (!values_[i]->Equals(other_list->values_[i])) {
				return false;
			}
		}
		return true;
	}

	friend class Atom;
protected:
	ExprList values_;
};

class Literal : public Expression {
public:
	Literal(ExprPtr expr) : expr_(expr) {}
	virtual ~Literal() {}
	virtual std::string ToString() const override { return "'" + expr_->ToString(); }
	virtual ExprPtr Evaluate(ExprMap& env) override {
		return expr_;
	}
	virtual bool IsAtom() const override { return expr_->IsAtom(); }
protected:
	ExprPtr expr_;
};

class Interpreter {
public:
	Interpreter() { AddBuiltins(); }
	~Interpreter() {}
	ExprPtr Parse(const std::string& expr_str) const;
	ExprPtr Evaluate(ExprPtr expr) {
		return expr->Evaluate(env_);
	}
private:
	void AddBuiltins();
	ExprMap env_;
};

int stoi(const std::string&  str)
{
	int sum = 0;
	int len = str.length();
	for (int i = 0; i < len; i++)
	{
		sum = sum * 10 + str[i] - '0';
	}
	return sum;
}

std::string to_string(int val)
{
	std::string str;
	std::vector<int> tmp;
	if (val == 0)
	{
		str.append(1, '0');
		return str;
	}
	while (val > 0)
	{
		tmp.push_back(val % 10);
		val /= 10;
	}
	for (int i = tmp.size() - 1; i >= 0; i--)
	{
		str.append(1, tmp[i] + '0');
	}
	return str;
}

ExprPtr Atom::Apply(ExprList args, ExprMap env) const {
	std::string func_name = value_;
	ExprPtr result;
	if (func_name == "+" || func_name == "-" || func_name == "*" || func_name == "/") {
		int op1 = ::stoi(args[0]->ToString());
		int op2 = ::stoi(args[1]->ToString());
		char op = func_name[0];
		int res;
		switch (op) {
		case '+': {
			res = op1 + op2;
			break;
		}
		case '-': {
			res = op1 - op2;
			break;
		}
		case '*': {
			res = op1 * op2;
			break;
		}
		case '/': {
			res = op1 / op2;
			break;
		}
		}
		result = std::make_shared<Atom>(to_string(res));
	}
	else if (func_name == "eq?") {
		if (args[0]->Equals(args[1])) {
			result = kTrue;
		}
		else {
			result = kFalse;
		}
	}
	return result;
}

ExprPtr List::Evaluate(ExprMap& env) {
	if (values_.empty()) {
		return shared_from_this();
	}
	std::string command = values_[0]->ToString();
	ExprPtr result;
	if (command == "quote") {
		result = values_[1];
	}
	else if (command == "define") {
		auto name_atom = std::static_pointer_cast<Atom>(values_[1]);
		std::string name = name_atom->ToString();
		auto value = values_[2]->Evaluate(env);
		env[name] = value;
		result = values_[0];
	}
	else if (command == "lambda") {
		result = shared_from_this();
	}
	else if (command == "cond") {
		for (int i = 1; i < values_.size(); i++) {
			auto branch = std::static_pointer_cast<List>(values_[i]);
			auto cond = branch->values_[0]->Evaluate(env);
			if (cond->Equals(kTrue)) {
				result = branch->values_[1]->Evaluate(env);
				break;
			}
		}
	}
	else {  // function call
		ExprPtr func = values_[0]->Evaluate(env);
		//std::clog << "Function: " << func->ToString() << std::endl;
		//std::clog << "Arguments:";
		ExprList args;
		for (int i = 1; i < values_.size(); i++) {
			args.push_back(values_[i]->Evaluate(env));
			//std::clog << ' ' << args.back()->ToString();
		}
		//std::clog << std::endl;
		result = func->Apply(args, env)->Evaluate(env);
	}
	return result;
}

ExprPtr List::Apply(ExprList args, ExprMap env) const {
	ExprMap func_env;
	auto param_list = std::static_pointer_cast<List>(values_[1]);
	for (int i = 0; i < param_list->values_.size(); i++) {
		auto param_name = param_list->values_[i];
		func_env[param_name->ToString()] = args[i];
	}
	auto func_body = std::static_pointer_cast<List>(values_[2]);
	return func_body->Substitute(func_env);
}

ExprPtr List::Substitute(ExprMap env) {
	ExprList result;
	for (ExprPtr element : values_) {
		result.push_back(element->Substitute(env));
	}
	return std::make_shared<List>(result);
}

ExprPtr Interpreter::Parse(const std::string& expr_str) const {
	bool literal = false;
	std::string token;
	std::stack<bool> literals;
	std::stack<ExprList> tokens;
	literals.emplace();
	tokens.emplace();
	for (char ch : expr_str) {
		if (ch == '\'') {
			literal = true;
		}
		else if (ch == '(') {
			literals.emplace(literal);
			tokens.emplace();
			literal = false;
		}
		else if (ch == ')' || ch == ' ') {
			if (!token.empty()) {
				ExprPtr expr = std::make_shared<Atom>(token);
				if (literal) {
					expr = std::make_shared<Literal>(expr);
				}
				tokens.top().push_back(expr);
				literal = false;
				token.clear();
			}
			if (ch == ')') {
				ExprPtr expr = std::make_shared<List>(tokens.top());
				tokens.pop();
				if (literals.top()) {
					expr = std::make_shared<Literal>(expr);
				}
				literals.pop();
				tokens.top().push_back(expr);
			}
		}
		else {  // ch should be letters, digits, or operators
			token += ch;
		}
	}
	if (!token.empty()) {
		ExprPtr expr = std::make_shared<Atom>(token);
		if (literal) {
			expr = std::make_shared<Literal>(expr);
		}
		return expr;
	}
	else {
		return tokens.top().front();
	}
}

void Interpreter::AddBuiltins() {
	env_["False"] = Expression::kFalse;
	env_["True"] = Expression::kTrue;
	env_["+"] = std::make_shared<Atom>("+");
	env_["-"] = std::make_shared<Atom>("-");
	env_["*"] = std::make_shared<Atom>("*");
	env_["/"] = std::make_shared<Atom>("/");
	env_["eq?"] = std::make_shared<Atom>("eq?");
}

const ExprPtr Expression::kFalse = std::make_shared<Atom>("False");
const ExprPtr Expression::kTrue = std::make_shared<Atom>("True");

int main() {
	freopen("E:\\10.in", "r", stdin);
	Interpreter interpreter;
	/*std::vector<std::string> program({
	  "(define twice (lambda (x) (+ x x)))",
	  "(define repeat (lambda (f) (lambda (x) (f (f x)))))",
	  "(repeat twice)",
	  "((repeat twice) 1)",
	});*/
	//for (std::string line : program) {
	std::string line;
	while (std::getline(std::cin, line)) {
		//std::clog << "# " << line << std::endl;
		ExprPtr expr = interpreter.Parse(line);
		ExprPtr result = interpreter.Evaluate(expr);
		std::cout << result->ToString() << std::endl;
	}
}
```

### 方法三：（较为暴力的C++解法）

思路：
定义全局变量映射，类型map<string,int>
定义变量环境参数名列表，和变量环境值列表，值与参数名位置一一对应
定义match函数，用来找某个标识符的值，先从变量环境里找，再从全局变量里找
定义一个计算函数，用来计算前缀表达式。
定义类func专门存函数操作，包括加减乘除eq?和lambda，存有参数列表和不含括号的token数组，调用时将参数列表对应的值传进来，再使用计算函数对计算过程进行计算即可。
定义函数库function，类型map<string,func*>
定义类cond存cond语句，把每个待判断的list的两项分别存起来，调用时使用计算函数依次计算第一项，若为真则计算相应的第二项并返回
定义cond语句库condition，类型map<string, cond*>
定义预处理函数，当前如果是define语句并且保存的是函数，则保存当前函数的参数数量
定义转换函数，将string转换为不含括号的token数组，转换过程中遇到cond或lambda，则调用相应的处理函数递归处理。
定义cond语句处理函数，分离每个list的第一项和第二项并创建新的cond对象，创建临时名字并将cond对象存入condition库，中途遇到cond或lambda则调用相应的处理函数递归处理。
定义lambda语句处理函数，先保存所有参数名，然后将后续计算过程转换为不含括号的token数组，创建func对象，创建临时名字并将func对象存入function库，中途遇到cond或lambda则调用相应的处理函数递归处理。
定义主处理函数，若第一个token是define，则当前是define语句，第二个token作为name，后续进行计算，将结果与name绑定（结果可能是全局变量也可能是函数）；若当前不是define语句，则直接转换计算过程vector并计算当前结果，输出

方法很暴力，但是计算速度却很快，计算样例10需要时间：56.369ms

代码：
```
#include <iostream>
#include<string>
#include<vector>
#include<queue>
#include<set>
#include<map>

#include<iterator>
#include<algorithm>
#include<stack>
#include<cstdlib>
#include<string.h>
#include<sstream>
using namespace std;
class func;
class cond;
string jisuan(vector<string>list);
void con(string s);
void lambda(string s);
vector<string> pro(string s);
//↑类和函数的前置声明
map<string, int> globalname;//全局变量
map<string, func*> function;//函数库，包括基本运算和自定义lambda表达式
map<string, cond*> condition;//cond语句库
int funcnum = 0;//已创建的临时函数数量
string funcname;//保存临时函数名
vector<string> tempname;//变量环境标识符列表
vector<int> tempval;//变量环境值列表，与上述列表一一对应
stack<vector<string>> stname;//变量环境栈
stack<vector<int>> stval;//同上
map<string, int>funcelement;//预处理使用，统计每个define的函数需要的参数数量
int leftk = 0;//统计左括号数量，预处理使用
int elementnum = 0;//统计函数参数数量，预处理使用

//下述注释中出现的“计算过程vector”的含义为不含括号的token数组

string sw(int x, int y, char c)//四则运算，将结果保存为字符串
{
	ostringstream ss;
	int res;
	switch (c)
	{
	case '+':res = x + y; break;
	case '-':res = x - y; break;
	case '*':res = x * y; break;
	case '/':res = x / y; break;
	}
	ss << res;
	return ss.str();
}
//无计算意义的字符：左右括号和空格
void clear(string &s, int j,int mode = 0)//将s字符串从第j字符开始删除所有无计算意义的字符
{//mode==1时同时统计途中遇到的左括号数，预处理时用到
	if (mode == 1)
		leftk = 0;
	for (int i = j; i < s.length(); i++)
		if (s[i] == ' ' || s[i] == ')' || s[i] == '(')
		{
			if (mode == 1 && s[i] == '(')
				leftk++;
			if (i == s.length() - 1)
				s = "";
		}
		else
		{
			s = s.substr(i);
			break;
		}
}
string firstword(string &s,int mode = 0)//从s字符串找出第一个有计算意义的单词，并删除后续无计算意义的字符
{
	string word;
	int j = 0;
	for (int i = 0; i < s.length(); i++)
		if (s[i] == ' ' || s[i] == ')' || s[i] == '(')
		{
			word = s.substr(0, i);
			j = i;
			break;
		}
	if (j == 0)
	{
		word = s;
		s = "";
	}
	clear(s, j, mode);
	return word;
}
string firstlist(string &s)//从s字符串找出完整列表，并删除后续无计算意义的字符
{//传进来的格式应该是：“....） .... ”
	int k = 1; int j = 0;
	string list;
	for (int i = 0; i < s.length(); i++)
		if (s[i] == '(')
			k++;
		else if (s[i] == ')')
		{
			k--;
			if (k == 0)
			{
				list = s.substr(0, i);
				j = i;
				break;
			}
		}
	clear(s, j);
	return list;
}

bool exist(string name)//当前变量环境是否有名为name的变量
{
	for (int i = 0; i < tempname.size(); i++)
		if (name == tempname[i])
			return true;
	return false;
}
int match(string name)//根据name变量名找对应的值
{//先从变量环境中找，再从全局变量里找，否则是普通数字直接转换
	for (int i = tempname.size()-1; i >= 0; i--)
		if (tempname[i] == name)
			return tempval[i];
	if (globalname.count(name) == 0)
		return stoi(name);
	else
		return globalname[name];
}
void newfunc()//创建新的临时函数名，保存到funcname中
{
	stringstream ss;
	ss << "%" << funcnum;
	funcnum++;
	funcname = ss.str();
}
class func//每个func存放一个函数操作，包括lambda与基本运算
{
private:
	vector<string> localname; //参数列表
	vector<string> compute; //计算过程
	vector<int> localval; //外层参数值，只有嵌套定义时此vector才有东西
public:
	string name;//函数名，只有基本运算需要这个值
	int listsize;
	func(vector<string>& localname, vector<string>& compute , vector<int> localval= vector<int>(), string name = "")
	{
		this->localname = localname;
		this->compute = compute;
		this->name = name;
		this->localval = localval;
		this->listsize = localname.size();
	}
	func(func &a)
	{
		this->localname = a.localname;
		this->localval = a.localval;
		this->listsize = a.listsize;
		this->compute = a.compute;
	}
	void rnew(vector<string> &localname, vector<int> &localval)//将一些参数和他的值存到当前函数的开头
	{//只有函数嵌套定义时才会调用
		this->localname.insert(this->localname.begin(), localname.begin(), localname.end());
		this->localval.insert(this->localval.begin(), localval.begin(), localval.end());
	}
	void changname(vector<string> &name)//改名，用传进来的name列表，计算过程中出现的所有name列表里出现过的东西全改名，在后面加一个%
	{//只有当该函数作为外层函数的返回值时才调用此函数
		bool fl[200];
		memset(fl, false, sizeof(fl));
		for(int j=0;j<name.size();j++)
			for (int i = 0; i < compute.size(); i++)
			{
				if (!fl[i] && name[j] == compute[i])
				{
					compute[i] += '%';
					fl[i] = true;
				}
			}
	}
	string stcom(vector<int> &val,bool push)//计算当前函数结果，val是传进来的值，push是变量更新方式
	{//push为true为压栈方式，计算前将当前变量环境压栈并将当前函数的参数表作为新变量环境
	 //push为false为嵌套情况，不压栈而是把当前函数函数参数表加在当前变量环境后面
		if (name == "+" || name == "-" || name == "*" || name == "/")
			return sw(val[0], val[1], name[0]);
		if (name == "eq?")
			return val[0] == val[1] ? "1" : "0";
		localval.insert(localval.end(), val.begin(), val.end());
		if (push)
		{//压栈
			stname.push(tempname);
			stval.push(tempval);
			tempname = localname;
			if (localval.size() == localname.size())//值列表为与变量列表大小相同的表
				tempval = localval;
			else
				tempval = val;
		}
		else
		{
			//加在当前变量环境后面
			tempname.insert(tempname.end(), localname.begin(), localname.end());
			tempval.insert(tempval.end(), localval.begin(), localval.end());
		}
		string res = jisuan(compute);//计算函数结果
		if (push)
		{//弹栈
			tempname = stname.top();
			tempval = stval.top();
			stname.pop();
			stval.pop();
			if (function.count(res)==1&&res[0] == '%')//如果函数的返回值是函数
			{//为这个返回的函数的参数改名，防止与其他变量重名
				vector<string> tname = localname;
				function[res]->changname(tname);
				for (int i = 0; i < tname.size(); i++)
					tname[i] += '%';
				//改名后加到变量环境后面
				tempname.insert(tempname.end(), tname.begin(), tname.end());
				tempval.insert(tempval.end(), localval.begin(), localval.end());
				elementnum += localname.size();//统计个数，之后删除的时候一起删了
			}
		}
		else
		{	//非压栈方式删除环境中的变量
			for (int i = 0; i < localname.size()+elementnum; i++)
			{
				tempname.pop_back();
				tempval.pop_back();
			}
			elementnum = 0;
		}
		for (int i = 0; i < val.size(); i++)//传进来的val从localval删除供下一次使用
			localval.pop_back();
		return res;
	}
};
class cond//一个cond对象存一个cond语句操作，并临时命名存到condition库中
{
private:
	vector<vector<string>> listfirst;//每条list的第一项
	vector<vector<string>> listlast;//每条list的第二项
public:
	cond(vector<vector<string>> fi, vector<vector<string>>la)
	{
		listfirst = fi;
		listlast = la;
	}
	string stcom()//计算当前cond语句的值
	{//按顺序计算listfirst【i】，当计算结果为1，则计算相应的listlast【i】并返回
		for (int i = 0; i < listfirst.size(); i++)
			if (jisuan(listfirst[i]) == "1")
				return jisuan(listlast[i]);
		return 0;
	}
};
string jisuan(vector<string> temp)//传进来的temp为计算过程，返回计算结果
{//思路，计算前缀表达式
	stack<string> st;
	stack<int> namenum;
	stack<int> list;//计算上一个函数需要的参数数量
	int num = 0;
	for (int i = 0; i < temp.size(); i++)
	{
		if (function.count(temp[i]) == 1&&!exist(temp[i]))//遇到函数，压栈
		{
			st.push(temp[i]);
			list.push(function[temp[i]]->listsize);
			namenum.push(num);
			num = 0;
		}
		else if (condition.count(temp[i]) == 1)//遇到cond语句，计算该语句值，替换当前位置重新处理
		{
			string res = condition[temp[i]]->stcom();
			temp[i] = res;
			i--;
		}
		else
		{
			num++;
			st.push(temp[i]);
			if (list.empty())//只剩一个变量或数，找到值作为计算结果返回
			{
				st.pop();
				stringstream ss;
				ss << match(temp[i]);
				st.push(ss.str());
				break;
			}
			while (!list.empty())
			{
				if (num < list.top())//当前变量不足以计算上一个压栈的函数
					break;
				else
				{//变量数足够计算上一个压栈的函数
					vector<int> valtemp;
					for (int i = 0; i < num; i++)
					{
						valtemp.push_back(match(st.top()));
						st.pop();
					}
					reverse(valtemp.begin(), valtemp.end());//取值并反转
					bool push = true;//设置变量环境更新方式
					if (st.top()[0] == '%')
						push = false;
					string res = function[st.top()]->stcom(valtemp, push);//传值并计算当前函数
					st.pop();
									
					if (function.count(res) == 1)//如果返回时是函数，压栈并创建新的函数作为返回值
					{
						namenum.pop();
						list.pop();
						func *f = new func(*function[res]);
						f->rnew(tempname, tempval);
						newfunc();
						function[funcname] = f;
						res = funcname;
						list.push(function[funcname]->listsize);
						namenum.push(num);
						num = 0;
					}
					else//返回值不是函数
					{
						num = namenum.top() + 1;
						namenum.pop();
						list.pop();
					}
					st.push(res);
				}
			}
		}

	}
	return st.top();
}

void cond_lamd(string &s,string word)
{//s格式：“cond （...） (...) 其余选择列表 )”或 “lambda (x1 x2 ... ） ( ...计算过程...) )”
	string list = firstlist(s);
	firstword(list);
	if (word == "cond")
		con(list);
	else
		lambda(list);
	s = funcname + " " + s; //将保存的临时函数名存到当前待处理字符串开头，返回继续处理
}


void lambda(string s)//传进来string的格式："x1 x2 ... ） ( ...计算过程...) )"
{
	vector<string>name;//参数列表
	
	string word;
	string list = firstlist(s); //list格式：“x1 x2 ...) ”
	while (list != "")//每次取第一个word存进参数列表
	{
		word = firstword(list);
		name.push_back(word);
	}
	//此时s格式：“...计算过程...) )”
	vector<string>com = pro(s);//转换计算过程vector
	newfunc();
	func *f = new func(name, com);
	function[funcname] = f;//为当前lambda函数临时命名并存到函数库中
}
void con(string s)//s格式：“...） (...) 其余选择列表 )”
{
	bool first = true;
	int i = 0, j = 0, num = 1;
	
	string laststring;
	vector < vector<string>> fi,la; //fi为每个cond列表的第一项，la为第二项
	//j与num是控制当前需要保存的东西是第i个cond列表的第一项还是第二项的变量
	//j是当前已经保存了多少个变量，num是一共需要保存多少变量
	//当j==num时，若当前保存的是第i个cond列表的第一项，则下一个要保存的是第i个列表的第二项
	//若当前保存的是第i个cond列表的第二项，则下一个要保存的是第i+1个列表的第一项
	fi.push_back(vector<string>());
	la.push_back(vector<string>());
	string word ;
	while (s != "")
	{
		laststring = s;
		word = firstword(s);
		bool save = true;
		if (function.count(word) == 1 && !exist(word))
			num += function[word]->listsize-1;
		else if (word == "lambda"||word=="cond")
		{//cond或lambda的嵌套定义，将取word之前的string传进cond_lamd函数
			s = laststring;
			cond_lamd(s, word);
			save = false; //嵌套定义处理完毕后不保存，其他情况保存
		}
		else if (funcelement.count(word)==1)
			num += funcelement[word] - 1;
		else//变量
			j++;

		if (save)
		{
			if (first)
				fi[i].push_back(word);
			else
				la[i].push_back(word);
		}
		save = true;
		if (j == num)
		{
			if (!first)
			{
				i++;
				fi.push_back(vector<string>());
				la.push_back(vector<string>());
			}
			first = !first;
			j = 0, num = 1;
		}
	}
	newfunc();
	cond *c = new cond(fi, la);
	condition[funcname] = c;//为当前cond命令临时命名并存到condition库中
}

vector<string> pro(string s)
{//将当前需要计算的字符串s转换成计算过程vector
	vector<string> res;
	string last = s;
	string word;
	while (s != "")
	{
		last = s;
		word = firstword(s);
		if (word == "cond"||word=="lambda")
		{//cond或lambda的嵌套定义，将取word之前的string传进cond_lamd函数
			s = last;
			cond_lamd(s, word);
		}
		else
			res.push_back(word);
	}
	return res;
}

void read(string s)
{//处理当前读进来的string
	for (int i = 0; i < s.length(); i++)//去掉开头的所有（
		if (s[i] != '(')
		{
			s = s.substr(i);
			break;
		}
	string last = s;
	string word = firstword(s);
	if (word == "define")
	{//第一个word是define，则第二个word为当前定义的name，计算后续结果保存为name（结果可能是数，也可能是函数）
		string name = firstword(s);
		last = s;
		string kind = firstword(last);
		vector<string>com = pro(s);
		string res = jisuan(com);
		if (function.count(res) == 1)
			function[name] = function[res];
		else
			globalname[name] = atoi(res.c_str());
		cout << "define" << endl;
	}
	else
	{//当前不是define语句，则直接转换计算过程vector并计算当前结果，输出
		vector<string>com = pro(last);
		string res = jisuan(com);
		cout << res << endl;
	}
}

void preread(string s)//预处理，目的：当前如果是define语句并且保存的是函数，则保存当前函数的参数数量
{
	if (s[0] == '(')
		s = s.substr(1);
	string word = firstword(s);
	if (word == "define")
	{
		string name = firstword(s, 1);
		string kind = firstword(s);
		if (kind == "lambda"&&leftk == 1)//只有读进来的string格式是“(define name (lambda.....”时定义的才是函数（name与lambda之间的左括号只有一个）
		{
			vector<string>namelist;
			string word;
			string list = firstlist(s);
			while (list != "")//统计参数个数
			{
				word = firstword(list);
				namelist.push_back(word);
			}
			funcelement[name] = namelist.size();
		}
	}
}
int main()
{
	//存全局变量，Flase是样例中出现的名字，但之前没有被定义过，怀疑打错字了
	globalname["True"] = 1;
	globalname["False"] = 0;
	globalname["Flase"] = 0;
	//定义基本运算，内部vector内容不重要，只知道name和listsize即可，其余元素随便填
	vector<string> v{ "%x", "%y" };
	vector<int> v2;
	func f0(v, v, v2, "+"); function["+"] = &f0;
	func f1(v, v, v2, "-"); function["-"] = &f1;
	func f2(v, v, v2, "*"); function["*"] = &f2;
	func f3(v, v, v2, "/"); function["/"] = &f3;
	func f4(v, v, v2, "eq?"); function["eq?"] = &f4;
	string program[200];//不超过200条语句
	freopen("E:\\10.in", "r", stdin);
	string s;
	int i = 0;
	while (getline(cin, s))//先读一遍并预处理
	{
		program[i] = s;
		i++;
		preread(s);
	}
	for (int j = 0; j < i; j++)//再每一条语句按顺序计算
		read(program[j]);

	//read("(cond  (False 7) ((eq? False False) 5))");
	//read("True");
	//string conn = firstlist(c);
	//firstword(conn);
	//con(conn);
	//cout << condition["%0"]->stcom();
	//vector<int> v{1,2,3,4};
	////////////////////////////////////
	//string s = "s";
	//cout << firstword(s) << endl << s;
	/*read("(define 1fact (lambda (n) (cond ((eq? n 1) 1) (True (* n (1fact (- n 1)))))))");
	read("(1fact 1)");
	read("(1fact 2)");
	read("(1fact (* 2 5))");
	read("(define 1sum (lambda (n) (cond ((eq? n 1) 1) (True (+ n (1sum (- n 1)))))))");
	read("(1sum (+ 25 25))");
	read("(define 1sqr+y (lambda (x) (+ 1y (* x x))))");
	read("(define 1f (lambda (x 1y) (1sqr+y x)))");
	read("(define 1y 10)");
	read("(1sqr+y 5)");
	read("(1f 5 1)");
	read("(define 00t6 ((lambda (* define eq?) (/ (+ * define) eq?)) 200 (1sum (/ (1fact 6) (1fact (* 2 2)))) 3))");
	read("00t6");*/
	//read("(define q 8)");
	//read("(define J<D?S 9)");
	//read("(define sAUSk(*(+ 231 365) (/ 992 (+ 662 445))))");
	//read("(define DKqJ(*(+ 819 663) (/ 298 (+ 736 844))))");
	//read("(define >=taz OL)");
	//read("(define L/77? f_W0u)");
	//read("(define n!P(/ (+ 915 (- 224 J<D?S)) (- 711 J<D?S)))");
	//read("(define =L(*(+ 330 1091) (/ 838 (+ 231 934))))");
	//read("(define bu(+(+ J<D?S(- 127 f_W0u)) (- 1053 iY*0h)))");
	//read("(define O(*(+ 563 344) (/ 808 (+ 685 935))))");;;
	//read("(define o4u3G(*(+ 175 838) (/ 1081 (+ 1064 915))))");
	//read("(define bJ* (+ (+ (cond ((eq? False (eq? 1 2)) (cond (False 833) ((eq? 0 ioz3H) L/77?) ((eq? 1 f_W0u) DKqJ) (True 1014))) (True 979) (True 402) ((eq? True Flase) 1021)) (/ q 238)) (+ 269 L/77?)))");
	//cout << globalname["bJ*"] << endl;
	//cout << globalname["<"] << endl;
	//cout << globalname["bu"] << endl;
}

```


