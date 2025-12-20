# AI Coding Agents - Universal Guidelines

This document provides context, coding standards, and workflows for AI coding assistants (Gemini, Claude Code, Codex, Cursor, etc.).

---

## 🎯 Project Context

### Environment
- **Primary OS**: macOS / Linux
- **Shell**: zsh (preferred), bash (fallback)
- **Package Manager**: Homebrew (macOS), apt/yum (Linux)
- **Editor**: Vim, VSCode, or other modern editors
- **Version Control**: Git

### Development Philosophy
- **Clarity over cleverness**: Write code that's easy to understand
- **Incremental progress**: Make small, testable changes
- **Documentation**: Document non-obvious decisions
- **Testing**: Verify changes before committing

---

## 📝 Coding Standards

### General Principles

1. **Naming Conventions**
   - Use descriptive, self-documenting names
   - Follow language-specific conventions (camelCase, snake_case, etc.)
   - Avoid abbreviations unless widely recognized
   - Boolean variables should read like questions (e.g., `isValid`, `hasPermission`)

2. **Code Organization**
   - Keep functions small and focused (single responsibility)
   - Group related functionality together
   - Separate concerns (presentation, business logic, data access)
   - Use consistent file/directory structures

3. **Comments & Documentation**
   - Write comments for "why", not "what"
   - Document complex algorithms or business logic
   - Keep comments up-to-date with code changes
   - Use docstrings/JSDoc for public APIs

4. **Error Handling**
   - Handle errors gracefully
   - Provide meaningful error messages
   - Don't silently swallow exceptions
   - Log errors appropriately

### Language-Specific Standards

#### Python
```python
# Use snake_case for variables and functions
def calculate_total_price(items):
    """Calculate the total price of items."""
    return sum(item.price for item in items)

# Use type hints
def greet(name: str) -> str:
    return f"Hello, {name}!"

# Follow PEP 8 (4 spaces, max 120 chars per line)
```

#### JavaScript/TypeScript
```javascript
// Use camelCase for variables and functions
function calculateTotalPrice(items) {
  return items.reduce((sum, item) => sum + item.price, 0);
}

// Use const/let, avoid var
const API_URL = 'https://api.example.com';
let currentUser = null;

// Use arrow functions for callbacks
items.map(item => item.price);
```

#### Shell Scripts
```bash
# Use lowercase with underscores
get_user_input() {
    local input=""
    read -r input
    echo "$input"
}

# Quote variables to prevent word splitting
echo "${variable}"
```

---

## 🔄 AI Coding Workflow

### 1. Understanding the Task
- Read the entire request carefully
- Ask clarifying questions if needed
- Identify dependencies and prerequisites
- Consider edge cases and potential issues

### 2. Planning
- Break down complex tasks into smaller steps
- Identify files that need to be created/modified
- Consider the impact on existing code
- Plan for testing and verification

### 3. Implementation
- Make small, incremental changes
- Test each change before proceeding
- Use `git status` and `git diff` frequently
- Keep commits focused and atomic

### 4. Verification
- Run tests (if available)
- Manually verify functionality
- Check for linting/formatting issues
- Review changes with `git diff` before committing

### 5. Documentation
- Update README if necessary
- Add/update code comments
- Document breaking changes
- Update relevant documentation files

---

## 🛠️ Preferred Commands & Tools

### File Operations
```bash
# Read file contents
cat filename.txt

# List files with details
ls -la

# Show directory tree
tree -L 3 -I 'node_modules|.git|dist|build'

# Find files
find . -name "*.py" -type f

# Search in files
grep -r "pattern" .
```

### Git Operations
```bash
# Always check status before making changes
git status

# Review changes before committing
git diff
git diff --staged

# View history
git log --oneline --graph -20

# Commit with meaningful messages
git commit -m "feat: add user authentication"
git commit -m "fix: resolve null pointer in getUserData"
git commit -m "docs: update API usage examples"
```

### Development Tools
```bash
# Python
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Node.js
npm install
npm run dev
npm test

# Make
make build
make test
make install
```

---

## 🎨 Commit Message Conventions

Follow the [Conventional Commits](https://www.conventionalcommits.org/) format:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `test`: Adding or modifying tests
- `chore`: Maintenance tasks (dependencies, configs, etc.)
- `perf`: Performance improvements

### Examples
```bash
feat(auth): add JWT token validation
fix(api): resolve timeout issue in getUserData
docs(readme): update installation instructions
refactor(utils): extract validation logic into helpers
test(api): add integration tests for user endpoints
chore(deps): update dependencies to latest versions
```

---

## 🚨 Safety & Security

### Command Approval
The following commands are generally safe and should be auto-approved:
- `git status`, `git log`, `git diff`
- `ls`, `cat`, `pwd`, `tree`, `echo`
- `git add` (review with `git diff` first)
- `git commit` (with meaningful messages)

### Commands Requiring Caution
Always confirm before running:
- Deletion commands (`rm -rf`, `git reset --hard`)
- System-level changes (`sudo`, `chmod`, `chown`)
- Network operations (`curl`, `wget`, external API calls)
- Package installations (`npm install`, `pip install`)

### Never Auto-Approve
- Operations that modify production environments
- Database migrations or schema changes
- Deployment commands
- Irreversible operations

### Protected System Paths
The following system paths are **BLOCKED** for all AI tools to prevent accidental damage:

#### Critical System Directories
- `/etc/*` - System configuration files
- `/usr/bin/*`, `/usr/sbin/*` - System binaries
- `/bin/*`, `/sbin/*` - Essential system binaries
- `/System/*` - macOS system files
- `/Library/*` - macOS system library
- `/boot/*` - Boot loader files (Linux)
- `/root/*` - Root user home directory

#### Protected Data Directories
- `/var/db/*` - System databases
- `/var/root/*` - Alternative root directory
- `/private/etc/*` - macOS private configuration
- `/private/var/db/*` - macOS private databases

#### File Types to Avoid
- `*.plist` - macOS system preference files

#### Dangerous Commands
These commands are **NEVER** allowed:
- `sudo*` - Privilege escalation
- `rm -rf /*` - Recursive deletion from root
- `chmod 777*` - Overly permissive permissions
- `chown*` - Ownership changes
- `mkfs*` - Filesystem formatting
- `dd if=*` - Low-level disk operations
- `:(){ :|:& };:` - Fork bomb
- `mv * /*` - Moving everything to root

### Safe Working Areas
AI tools should **ONLY** operate in:
- User home directory: `~/` or `/Users/username/`
- Project directories under home
- Temporary directories: `/tmp/` (with caution)
- User-created directories in safe locations

---

## 📚 Best Practices

### Code Review Checklist
- [ ] Code follows language conventions
- [ ] Functions are small and focused
- [ ] Error handling is appropriate
- [ ] No hardcoded credentials or sensitive data
- [ ] Tests are included (if applicable)
- [ ] Documentation is updated
- [ ] Commit message is clear and descriptive

### Before Committing
1. Run `git status` to see what's changed
2. Run `git diff` to review changes
3. Run tests (if available)
4. Check for linting/formatting issues
5. Ensure commit message follows conventions

### Collaboration Tips
- Keep pull requests small and focused
- Respond to code review feedback promptly
- Be respectful and constructive in reviews
- Document breaking changes clearly

---

## 🔍 Debugging Strategies

1. **Understand the Problem**
   - Reproduce the issue consistently
   - Identify the expected vs actual behavior
   - Gather relevant error messages and logs

2. **Isolate the Issue**
   - Use binary search (comment out code sections)
   - Add logging/print statements strategically
   - Test with minimal input

3. **Fix and Verify**
   - Make the smallest change possible
   - Test the fix thoroughly
   - Ensure no regressions are introduced

4. **Prevent Future Issues**
   - Add tests for the bug
   - Document the fix
   - Consider if similar issues exist elsewhere

---

## 🎓 Learning Resources

### General
- Clean Code by Robert C. Martin
- The Pragmatic Programmer by Hunt & Thomas
- [Google Style Guides](https://google.github.io/styleguide/)

### Language-Specific
- Python: [PEP 8](https://peps.python.org/pep-0008/)
- JavaScript: [Airbnb Style Guide](https://github.com/airbnb/javascript)
- Go: [Effective Go](https://golang.org/doc/effective_go.html)

---

## 💡 Tips for AI Assistants

1. **Always provide context**
   - Explain your reasoning
   - Mention trade-offs considered
   - Highlight potential issues

2. **Be proactive but respectful**
   - Suggest improvements when appropriate
   - Ask for clarification when uncertain
   - Respect user preferences

3. **Maintain consistency**
   - Follow existing code style
   - Use established patterns
   - Match project conventions

4. **Communicate clearly**
   - Explain complex changes
   - Provide usage examples
   - Document assumptions

---

*Last updated: 2025-12-20*
*Location: `~/Devel/github.com/sopra/dotfiles/AGENTS.md`*
